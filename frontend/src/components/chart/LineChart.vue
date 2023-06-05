<template>
    <div>
        <canvas id="line"></canvas>
    </div>
</template>
  
<script>
import * as Chart from 'chart.js';

export default {
    data() {
        return {
        };
    },
    mounted() {
        this.createChart();
    },
    methods: {
        createChart(labels, datasets, title) {
            // 创建折线图图配置对象
            const chartConfig = {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: datasets,
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false, // 不保持纵横比
                    title: {
                        display: true,
                        text: title, // 折线图标题
                        fontSize: 18
                    },
                    legend: {
                        display: true, // 显示图例
                        position: 'bottom',
                        labels: {
                            fontSize: 15
                        }
                    },
                    layout: {
                        padding: {
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0
                        }
                    },
                },
            };

            // 使用 Chart.js 创建环状图
            new Chart(document.getElementById('line'), chartConfig);
        },
    },
};
</script>
  