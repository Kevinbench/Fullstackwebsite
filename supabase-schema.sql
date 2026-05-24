-- ═══════════════════════════════════════════════════
--  ATS Intelligence v3.0 — Supabase Database Schema
--  Run this entire file in: Supabase → SQL Editor → Run
-- ═══════════════════════════════════════════════════

-- Enable UUID extension
create extension if not exists "uuid-ossp";

-- ── CANDIDATES TABLE ──────────────────────────────
create table if not exists candidates (
  id          bigint primary key,
  created_at  timestamptz default now(),
  updated_at  timestamptz default now(),
  date        text,
  category    text default 'IT',
  candidate_name text not null,
  vendor_name text,
  phone       text,
  email       text,
  client      text not null,
  role        text not null,
  location    text,
  rate        text,
  status      text default 'Submitted',
  notes       text
);

-- ── INTERVIEWS TABLE ──────────────────────────────
create table if not exists interviews (
  id            bigint primary key,
  created_at    timestamptz default now(),
  updated_at    timestamptz default now(),
  candidate_id  bigint references candidates(id) on delete set null,
  candidate_name text,
  client        text,
  date          text,
  time          text,
  timezone      text default 'EST',
  mode          text default 'Virtual',
  round         text default 'Screening',
  status        text default 'Scheduled',
  interviewer   text,
  notes         text
);

-- ── AUTO-UPDATE updated_at ────────────────────────
create or replace function update_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

create trigger candidates_updated_at
  before update on candidates
  for each row execute function update_updated_at();

create trigger interviews_updated_at
  before update on interviews
  for each row execute function update_updated_at();

-- ── ROW LEVEL SECURITY (optional but recommended) ─
-- Uncomment these lines if you add Supabase Auth later:
-- alter table candidates enable row level security;
-- alter table interviews enable row level security;
-- create policy "Allow all" on candidates for all using (true);
-- create policy "Allow all" on interviews for all using (true);

-- ── INDEXES for faster queries ─────────────────────
create index if not exists candidates_status_idx  on candidates(status);
create index if not exists candidates_client_idx  on candidates(client);
create index if not exists candidates_date_idx    on candidates(date);
create index if not exists interviews_date_idx    on interviews(date);
create index if not exists interviews_status_idx  on interviews(status);
create index if not exists interviews_cand_idx    on interviews(candidate_id);

-- ── VERIFY ────────────────────────────────────────
select 'candidates table' as table_name, count(*) as rows from candidates
union all
select 'interviews table', count(*) from interviews;
