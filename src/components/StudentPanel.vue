<template>
    <div class="student-panel">
        <span v-if="icon" class="icon">{{ icon }}</span>
        <span>{{ text }}</span>
        <button class="delete-student">X</button>
    </div>
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
    .student-panel {
        height: 40px;
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 10px 0px 10px 20px;

        border: 2px solid var(--orange);
        border-radius: 40px;
        background: var(--beige);
        justify-content: space-between;
    }
    
    .delete-student {
        background: var(--orange);
        border: none;
        border-radius: 40px;
        width: 40px;
        height: 40px;
        cursor: pointer;
    }

    .delete-student:hover {
        background: var(--purple);
        color: white;
    }
</style>