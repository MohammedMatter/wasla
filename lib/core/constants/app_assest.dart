class AppAssest {
  static const String successRegister = '''
<svg width="200" height="200" viewBox="0 0 200 200" fill="none" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="grad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#62dfd3;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#2a9d8f;stop-opacity:1" />
    </linearGradient>
    <filter id="shadow" x="-20%" y="-20%" width="140%" height="140%">
      <feDropShadow dx="0" dy="4" stdDeviation="4" flood-color="#000000" flood-opacity="0.15"/>
    </filter>
  </defs>
  <circle cx="100" cy="100" r="80" fill="url(#grad)" filter="url(#shadow)"/>
  <path d="M70 100L90 120L135 75" stroke="white" stroke-width="10" stroke-linecap="round" stroke-linejoin="round" />
</svg>
''';
}
