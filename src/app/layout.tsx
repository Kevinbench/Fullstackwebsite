import type { Metadata, Viewport } from 'next'

export const metadata: Metadata = {
  title: 'ATS Intelligence v3.0',
  description: 'Full Stack AI Recruitment Platform powered by Claude AI',
  keywords: ['ATS', 'Recruiting', 'HR Tech', 'AI', 'Applicant Tracking'],
}

export const viewport: Viewport = {
  width: 'device-width',
  initialScale: 1,
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body style={{ margin: 0, padding: 0, background: '#0B0B0F' }}>
        {children}
      </body>
    </html>
  )
}
