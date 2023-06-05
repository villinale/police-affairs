<template>
    <div>
        <canvas id="caseChart"></canvas>
    </div>
</template>
  
<script>
import * as Chart from 'chart.js';

export default {
    mounted() {
        this.createChart();
    },
    methods: {
        createChart() {
            const caseCount = 100; // 替换为实际的案件数
            const closedCount = 50; // 替换为实际的结案数

            const ratio = closedCount / caseCount;

            // 创建环状图配置对象
            const chartConfig = {
                type: 'doughnut',
                data: {
                    labels: ['案件数', '结案数'],
                    datasets: [
                        {
                            data: [caseCount, closedCount],
                            backgroundColor: ['rgba(255, 99, 132, 0.8)', 'rgba(54, 162, 235, 0.8)'],
                        },
                    ],
                },
                options: {
                    responsive: true,
                    cutout: '80%',
                    plugins: {
                        legend: {
                            display: true,
                            position: 'bottom',
                        },
                        title: {
                            display: true,
                            text: `案件数 vs 结案数\n比例: ${ratio.toFixed(2)}`,
                        },
                    },
                },
            };

            // 使用 Chart.js 创建环状图
            new Chart(document.getElementById('caseChart'), chartConfig);
        },
    },
};
</script>
  