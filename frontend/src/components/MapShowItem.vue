<template>
    <div class="map">
        <el-amap :center="center" :zoom="zoom" @init="init" />
    </div>
</template>

<script>
import { defineComponent } from "vue";
import { shallowRef } from '@vue/reactivity';

export default defineComponent({
    data() {
        return {
            zoom: 15,
            center: [121.59996, 31.197646],
            map: null,
            keyforweb: "5be7f264c67902ddf911675b64eff7fa",
        };
    },
    setup() {
        const marker = shallowRef(null);
        return {
            marker,
        }
    },
    methods: {
        initMap(lon, lat, address) {
            console.log(lon, lat, address);
            this.center = [lon, lat];
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
        },
        init(map) {
            this.map = map;
        },
    }
})
</script>
 
<style scoped>
.map {
    height: 40vh;
    width: 100vw;
    color: #413e3e;
}
</style>