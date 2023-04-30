<!--
 * @Author: yingxin wang
 * @Date: 2023-04-28 20:29:55
 * @LastEditors: yingxin wang
 * @LastEditTime: 2023-04-30 17:09:29
 * @Description: 地图组件，显示所有辖区地图
-->
 
<template>
    <div id="map"></div>
</template>

<script>
import AMapLoader from '@amap/amap-jsapi-loader';
import { shallowRef } from '@vue/reactivity';

export default {
    data() {
        return {
        }
    },
    setup() {
        const map = shallowRef(null);
        return {
            map,
        }
    },
    methods: {
        initMap() {
            AMapLoader.load({
                key: "f5d84e6e315b88e94510f92d132bc894",// 申请好的Web端开发者Key，首次调用 load 时必填
                version: "2.0",      // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
                plugins: [''],       // 需要使用的的插件列表，如比例尺'AMap.Scale'等
            }).then((AMap) => {
                this.map = new AMap.Map("map", {  //设置地图容器id
                    viewMode: "3D",    //是否为3D地图模式
                    zoom: 10,           //初始化地图级别
                    center: [121.470463, 31.224329], //初始化地图中心点位置
                    features: ['bg', 'road',],
                    mapStyle: "amap://styles/whitesmoke",
                    dragEnable: false,
                    zoomEnable: false,
                });

                var circle = new AMap.Circle({
                    center: new AMap.LngLat("121.476213", "31.237293"), // 圆心位置
                    radius: 200,  //半径
                    strokeColor: "#1f8fff",  //线颜色
                    strokeOpacity: 1,  //线透明度
                    strokeWeight: 3,  //线粗细度
                    fillColor: "#1f8fff",  //填充颜色
                    fillOpacity: 0.35 //填充透明度
                });
                this.map.add(circle);

                // 创建纯文本标记
                var text = new AMap.Text({
                    text: '上海市',
                    anchor: 'center', // 设置文本标记锚点
                    style: {
                        'padding': '.75rem 1.25rem',
                        'margin-bottom': '1rem',
                        'border-radius': '.25rem',
                        'background-color': 'rgb(40, 248, 255, 0)',
                        'border-width': 0,
                        'text-align': 'center',
                        'font-size': '18px',
                        'color': '#413e3e'
                    },
                    position: [121.470751, 31.246058]
                });

                text.setMap(this.map);
            }).catch(e => {
                console.log(e);
            })
        },
    },
    mounted() {
        //DOM初始化完成进行地图初始化
        this.initMap();
    }
    // mounted() {
    //     const map = L.map('map').setView({ lng: this.centerlng, lat: this.centerlat }, this.initzoom)
    //     //L.tileLayer('http://rt0.map.gtimg.com/realtimerender?z={z}&x={x}&y={-y}&type=vector&style=0', {
    //     //    L.tileLayer('https://t0.tianditu.gov.cn/vec_c/wmts?SERVICE=WMTS&REQUEST=GetTile&LAYER=vec&TILEMATRIXSET=c&FORMAT=tiles&VERSION=1.0.0&STYLE=default&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}&tk=2e98c48bfc5dd3bacaa991bbabf3cc7c', {
    //     L.tileLayer('https://t0.tianditu.gov.cn/vec_c/wmts?SERVICE=WMTS&REQUEST=GetTile&LAYER=vec&TILEMATRIXSET=c&FORMAT=tiles&VERSION=1.0.0&STYLE=default&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}&tk=2e98c48bfc5dd3bacaa991bbabf3cc7c', {
    //         maxZoom: this.maxzoom,
    //         attribution: '© 天地图'
    //     }).addTo(map)
    // }
}
</script>
 
<style scoped>
#map {
    height: 75vh;
    width: 100vw;
    color: #413e3e;
}
</style>