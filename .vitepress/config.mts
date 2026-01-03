import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: '斯图尔特微积分笔记',
  description: '分享学习微积分的心得',
  themeConfig: {
    logo: '/web-logo-transparent.png',
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: '主页', link: '/' },
      { text: '笔记', link: '/notes/00-intro/' },
    ],

    sidebar: [
      {
        text: '微积分概论',
        items: [
          { text: '以「极限」视角看「穷竭法」', link: '/notes/00-intro/' },
        ],
      },
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/ziyoung/calculus-note' },
    ],
  },
  head: [['link', { rel: 'icon', href: '/favicon.png' }]],
  markdown: {
    math: true,
  },
})
