<template>
    <button class="icon-button">
        <span v-if="icon" class="icon">{{ icon }}</span>
        <span class="icon-button-text">{{ text }}</span>
    </button>

</template>

<script setup>
    defineProps({
        text: {
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
    .icon-button {
        height: 50px;
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 10px 20px;
        border: none;
        border-radius: 40px;
        background: var(--orange);
        cursor: pointer;
        
    }

    .icon-button:hover {
        
        border-bottom: 5px solid var(--purple);
    }

    .icon-button-text {
        font-size: 18px;
    }
    
</style>