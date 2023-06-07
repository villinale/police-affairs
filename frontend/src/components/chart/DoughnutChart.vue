<template>
    <div>
        <canvas id="caseChart"></canvas>
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
        createChart(labels, data, backgroundColor, title) {
            // 创建环状图配置对象
            const chartConfig = {
                type: 'doughnut',
                data: {
                    labels: labels,
                    datasets: [
                        {
                            data: data,
                            backgroundColor: backgroundColor,
                        },
                    ],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false, // 不保持纵横比
                    responsive: true, // 允许图表响应容器大小变化
                    cutout: '80%',
                    legend: {
                        display: true,
                        position: 'bottom',
                        fontSize: 15
                    },
                    title: {
                        display: true,
                        text: title,
                        fontSize: 18
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
            new Chart(document.getElementById('caseChart'), chartConfig);
        },
    },
};
</script>
  