<template>
    <div id="map"></div>
</template>

<script>
import AMapLoader from '@amap/amap-jsapi-loader';
import { shallowRef } from '@vue/reactivity';

export default {
    data() {
        return {
            loc: {
                lon: 0,
                lat: 0,
                province: '',
                city: '',
                area: '',
                address: '',
            },
            keyforweb: "5be7f264c67902ddf911675b64eff7fa",
            keyforjs: "f5d84e6e315b88e94510f92d132bc894",
        }
    },
    setup() {
        const map = shallowRef(null);
        return {
            map,
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
        initMap() {
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
                    zoom: 10,           //初始化地图级别
                    center: [121.470463, 31.224329], //初始化地图中心点位置
                    mapStyle: "amap://styles/whitesmoke",
                });

                // 给地图选点绑定点击事件
                this.bondClickEvent();

            }).catch(e => {
                console.log(e);
            })
        },
    },
    mounted() {
        //DOM初始化完成进行地图初始化
        this.initMap();
    }
}
</script>
 
<style scoped>
#map {
    height: 40vh;
    width: 100vw;
    color: #413e3e;
}
</style>