<template>
    <div id="map"></div>
</template>

<script>
import AMapLoader from '@amap/amap-jsapi-loader';
import { shallowRef } from '@vue/reactivity';

export default {
    data() {
        return {
            keyforweb: "5be7f264c67902ddf911675b64eff7fa",
            keyforjs: "f5d84e6e315b88e94510f92d132bc894",
        }
    },
    setup() {
        const map = shallowRef(null);
        const marker = shallowRef(null);
        return {
            map,
            marker,
        }
    },
    methods: {
        initMap(lon, lat, address) {
            AMapLoader.load({
                key: this.keyforjs,// 申请好的Web端开发者Key，首次调用 load 时必填
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
                    zoom: 13,           //初始化地图级别
                    center: [lon, lat], //初始化地图中心点位置
                    mapStyle: "amap://styles/whitesmoke",
                });

                console.log(lon, lat, address);
                this.marker = new AMap.Marker({
                    position: new AMap.LngLat(lon, lat),   // 经纬度对象，也可以是经纬度构成的一维数组[116.39, 39.9]
                    title: address,
                    //content: address,
                });

                this.marker.setLabel({
                    offset: new AMap.Pixel(20, 20),  //设置文本标注偏移量
                    content: "<div class='map-markerinfo'>" + address + "</div>", //设置文本标注内容
                    direction: 'right' //设置文本标注方位
                });

                // 将创建的点标记添加到已有的地图实例：
                this.map.add(this.marker);

            }).catch(e => {
                console.log(e);
            })
        },
    },
    mounted() {
    }
}
</script>
 
<style scoped>
#map {
    height: 40vh;
    width: 100vw;
    color: #413e3e;
}

.map-markerinfo {
    background-color: #fff;
    border: 1px solid #0088ff;
    border-radius: 4px;
    padding: 5px;
    font-size: 15px;
    color: #0088ff;
    box-shadow: 0 2px 6px 0 rgba(114, 124, 245, .5);
}
</style>