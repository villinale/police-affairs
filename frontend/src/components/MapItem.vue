<!--
 * @Author: yingxin wang
 * @Date: 2023-04-28 20:29:55
 * @LastEditors: yingxin wang
 * @LastEditTime: 2023-04-30 20:23:47
 * @Description: 地图组件，显示所有辖区地图
-->
 
<template>
    <div id="map"></div>
</template>

<script>
import AMapLoader from '@amap/amap-jsapi-loader';
import AMapUI from '@amap/amap-jsapi-loader';
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
                AMapUI: {
                    version: '1.1',
                    plugins: ['geo/DistrictExplorer',
                        'overlay/SimpleMarker']
                },
                plugins: [''],       // 需要使用的的插件列表，如比例尺'AMap.Scale'等
            }).then(() => {
                this.map = new AMap.Map("map", {  //设置地图容器id
                    viewMode: "3D",    //是否为3D地图模式
                    zoom: 10,           //初始化地图级别
                    center: [121.470463, 31.224329], //初始化地图中心点位置
                    mapStyle: "amap://styles/whitesmoke",
                    //dragEnable: false,
                    //zoomEnable: false,
                });
                // var lngLats = [121.470751, 31.246058];

                // var ui1 = new AMapUI.SimpleMarker({
                //     iconLabel: '1',
                //     //自定义图标地址
                //     iconStyle: '//webapi.amap.com/theme/v1.3/markers/b/mark_r.png',

                //     //设置基点偏移
                //     offset: new AMap.Pixel(-19, -60),

                //     map: this.map,

                //     showPositionPoint: true,
                //     position: lngLats[0],
                //     zIndex: 100
                // });

                // var ui2 = new AMapUI.SimpleMarker({
                //     iconLabel: '2',
                //     //自定义图标节点(img)的属性
                //     iconStyle: {

                //         src: '//webapi.amap.com/theme/v1.3/markers/b/mark_b.png',
                //         style: {
                //             width: '20px',
                //             height: '30px'
                //         }
                //     },

                //     //设置基点偏移
                //     offset: new AMap.Pixel(-10, -30),

                //     map: this.map,
                //     showPositionPoint: true,
                //     position: lngLats[1],
                //     zIndex: 200
                // });

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