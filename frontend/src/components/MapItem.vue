<template>
    <div class="map-page-container">
        <el-amap :center="center" :zoom="zoom">
            <el-amap-layer-district :type="Province" adcode="310000" :depth="2" :styles="styles"></el-amap-layer-district>
        </el-amap>
    </div>
</template>
  
<style></style>
  
<script lang="ts">
import { defineComponent } from "vue";
// 颜色辅助方法

export default defineComponent({
    data() {
        let colors = {};
        const getColorByAdcode = function (adcode) {
            if (!colors[adcode]) {
                let gb = Math.random() * 155 + 50;
                colors[adcode] = 'rgb(' + gb + ',' + gb + ',255)';
            }

            return colors[adcode];
        };

        return {
            zoom: 10,
            center: [121.470463, 31.224329], //初始化地图中心点位置
            mapStyle: "amap://styles/whitesmoke",
            visible: true,
            depth: 2,
            styles: {
                'fill': function (properties) {
                    // properties为可用于做样式映射的字段，包含
                    // NAME_CHN:中文名称
                    // adcode_pro
                    // adcode_cit
                    // adcode
                    let adcode = properties.adcode;
                    return getColorByAdcode(adcode);
                },
                'province-stroke': 'cornflowerblue',
                'city-stroke': 'white', // 中国地级市边界
                'county-stroke': 'rgba(255,255,255,0.5)' // 中国区县边界
            }
        };
    },

    methods: {
        switchVisible() {
            this.visible = !this.visible;
        },
    },
});
</script>
<style scoped>
.map-page-container {
    height: 75vh;
    width: 100vw;
    color: #413e3e;
}
</style>