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
            zoom: 12,
            center: [121.59996, 31.197646],
            map: null,
            keyforweb: "5be7f264c67902ddf911675b64eff7fa",
            loc: {
                lon: 0,
                lat: 0,
                province: '',
                city: '',
                area: '',
                address: '',
            },
        };
    },
    setup() {
        const marker = shallowRef(null);
        return {
            marker,
        }
    },
    methods: {
        sendLoc() {
            this.$emit('getLoc', this.loc);
        },
        bondClickEvent() {
            //绑定点击事件获取经纬度
            this.map.on('click', (e) => {
                this.loc.lon = e.lnglat.lng;
                this.loc.lat = e.lnglat.lat;
                console.log(this.loc.lon, this.loc.lat);

                // 使用高德API获取地址
                const url = 'https://restapi.amap.com/v3/geocode/regeo?output=xml' +
                    '&location=' + this.loc.lon + ',' + this.loc.lat +
                    '&key=' + this.keyforweb;
                console.log(url)

                fetch(url)
                    .then(response => response.text())
                    .then(data => {

                        // 处理返回的数据
                        let result = this.$x2js.xml2js(data);

                        // 正确获取结果
                        const status = result.response.status;

                        if (status === '1') {
                            this.loc.address = result.response.regeocode.formatted_address;
                            this.loc.province = result.response.regeocode.addressComponent.province;
                            this.loc.city = result.response.regeocode.addressComponent.city;
                            this.loc.area = result.response.regeocode.addressComponent.district;

                            if (this.marker)
                                this.map.remove(this.marker);

                            // 创建一个 Marker 实例：
                            this.marker = new AMap.Marker({
                                position: new AMap.LngLat(this.loc.lon, this.loc.lat),   // 经纬度对象，也可以是经纬度构成的一维数组[116.39, 39.9]
                                title: this.loc.address,
                                label: this.loc.address
                            });

                            this.marker.setLabel({
                                offset: new AMap.Pixel(20, 20),  //设置文本标注偏移量
                                content: "<div class='map-markerinfo'>" + this.loc.address + "</div>", //设置文本标注内容
                                direction: 'right' //设置文本标注方位
                            });

                            // 将创建的点标记添加到已有的地图实例：
                            this.map.add(this.marker);

                            //向父组件发送数据
                            this.sendLoc();

                        } else {
                            console.log('No results found, status is zero.');
                        }
                    })
                    .catch(error => {
                        // 处理错误
                        console.error(error);
                    });
            });
        },
        init(map) {
            this.map = map;
            this.bondClickEvent();
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