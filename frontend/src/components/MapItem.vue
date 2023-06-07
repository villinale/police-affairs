<template>
    <div class="map-page-container">
        <el-amap :center="center" :zoom="zoom">
            <el-amap-layer-district type="Province" adcode="310000" :depth="2" :styles="styles"></el-amap-layer-district>
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
                colors[adcode] = 'rgba(' + gb + ',' + gb + ',255,0.6)';
            }
            return colors[adcode];
        };

        return {
            zoom: 9,
            center: [121.59996, 31.197646],
            visible: true,
            styles: {
                'fill': function (properties) {
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
    }
});
</script>
<style scoped>
.map-page-container {
    height: 75vh;
    width: 100vw;
    color: #413e3eac;
}
</style>