/** @type {import('next').NextConfig} */
const nextConfig = {
  // Static export for GitHub Pages / Netlify
  // Comment this out if using Vercel (not needed there)
  // output: 'export',

  // If deploying to GitHub Pages sub-path like /ats-intelligence
  // uncomment and set your repo name:
  // basePath: '/ats-intelligence',
  // assetPrefix: '/ats-intelligence/',

  images: {
    unoptimized: true,
  },
};

module.exports = nextConfig;
