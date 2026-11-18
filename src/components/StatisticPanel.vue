<template>
    <div class="statistic-panel">
        <div class="statistic-info"style="display:flex; gap:10px;">
            <span v-if="icon" class="icon">{{ icon }}</span>
            <span class="statistic-title">{{ title }}</span>
        </div>

        <div class="part-two" style="display:flex; gap:10px;">
            <span class="first-statistic">{{ firstStatistic }}</span>
        </div>
        <div class="part-three" style="display:flex; gap:10px;">
            <span class="second-statistic">{{ secondStatistic }}</span>
        </div>
    </div>
</template>

<script setup>
    defineProps({
        title: {
            type: String,
            required: true
        },
        firstStatistic: {
            type: String,
            required: true
        },
        secondStatistic: {
            type: String,
            required: true
        },
        icon: {
            type: String,
            default: ''
        }
    })
</script>

<style>
    .statistic-panel {
        width: 100%;
        height: 58px;
        background: var(--pink);
        border: none;
        border-radius: 40px;
        display: flex;
        align-items: center;
        
        padding: 20px;
        padding-right: 0;
        font-size: 18px;
    }

    .statistic-info {
        flex: 3;
        max-width: 600px;
    }

    .part-two {
        flex: 2;
    }
    .part-three {
        flex: 1;
    }
</style>