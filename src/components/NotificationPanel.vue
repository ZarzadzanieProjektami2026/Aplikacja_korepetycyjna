<template>
    <div class="notification-panel">
        <div style="display:flex; gap:10px;">
            <span v-if="icon" class="icon">{{ icon }}</span>
            <span class="notification-title">{{ title }}</span>
        </div>
        <span class="notification-date">{{ date }}</span>
        <span class="notification-time">{{ time }}</span>
        
    </div>

</template>

<script setup>
    defineProps({
        title: {
            type: String,
            required: true
        },
        date: {
            type: String,
            required: true
        },
        time: {
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
    .notification-panel {
        width: 100%;
        height: 50px;
        background: var(--light-blue);
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px 20px;
        font-size: 18px;
        border-radius: 40px;
    }
</style>