module.exports = {
  root: true,
  env: {
    node: true,
  },
  extends: [
    'plugin:vue/vue3-essential',
    'eslint:recommended',
    'AMap:window.Amap',
    'AMapUI:window.AMapUI'
  ],
  globals: {
    AMap: true,
    AMapUI: true,
  },
}
