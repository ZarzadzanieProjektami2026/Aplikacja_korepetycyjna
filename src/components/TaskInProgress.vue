<template>
    <div class="task-in-progress">
        <div class="task-info"style="display:flex; gap:10px;">
            <span v-if="taskIcon" class="icon">{{ taskIcon }}</span>
            <span class="task-title">{{ title }}</span>
        </div>

        <div class="part-two" style="display:flex; gap:10px;">
            <span v-if="progressIcon" class="icon">{{ progressIcon }}</span>
            <span class="task-progress">{{ progress }}</span>
        </div>
        <div class="part-three" style="display:flex; gap:10px;">
            <span v-if="timeIcon" class="icon">{{ timeIcon }}</span>
            <span class="task-time-left">{{ timeLeft }}</span>
        </div>
        <button class="btn-continue">Kontynuuj</button>
    </div>
</template>

<script setup>
    defineProps({
        title: {
            type: String,
            required: true
        },
        progress: {
            type: String,
            required: true
        },
        timeLeft: {
            type: String,
            required: true
        },
        taskIcon: {
            type: String,
            default: ''
        },
        progressIcon: {
            type: String,
            default: ''
        },
        timeIcon: {
            type: String,
            default: ''
        }
    })
</script>

<style>
    .task-in-progress {
        width: 100%;
        height: 58px;
        background: var(--beige);
        border: 5px solid var(--green);
        border-radius: 40px;
        display: flex;
        align-items: center;
        
        padding: 10px 20px;
        padding-right: 0;
        font-size: 18px;
    }

    .btn-continue {
        background: var(--green);
        border: none;
        border-radius: 40px;
        height: 58px;
        width: 78px;
        cursor: pointer;
        font-size: 13px;
        margin-right: -5px;
    }

    .btn-continue:hover {
        background: var(--light-green);
        border: 5px solid var(--green);
    }

    .task-info {
        flex: 3;
        max-width: 300px;
    }

    .part-two {
        flex: 2;
    }
    .part-three {
        flex: 1;
    }
</style>