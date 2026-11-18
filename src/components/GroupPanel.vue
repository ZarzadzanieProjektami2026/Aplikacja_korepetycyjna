<template>
    <div class="group-panel">
        <div class="part-one">
            <span v-if="icon" class="icon">{{ icon }}</span>
            <span class="group-name">{{ text }}</span>
        </div>
        <div class="part-two">
            <span class="student-number">{{ studentNumber }}</span>
        </div>
        <div class="part-three">
            <button class="edit-group-btn">Edytuj grupę</button>
        </div>
        <button class="open-group-btn">-></button>
    </div>

</template>

<script setup>
    defineProps({
        text: {
            type: String,
            required: true
        },
        studentNumber: {
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
    .group-panel {
        width: 100%;
        height: 58px;
        background: var(--yellow);
        border: 5px solid var(--orange);
        border-radius: 40px;
        display: flex;
        align-items: center;
        padding: 10px 20px;
        padding-right: 0;

    }

    .edit-group-btn {
        background: var(--orange);
        border: none;
        border-radius: 40px;
        height: 58px;
        width: 150px;
        cursor: pointer;
        font-size: 18px;
        margin-right: -5px;
    }

    .edit-group-btn:hover {
        background: var(--yellow);
        border: 5px solid var(--orange);
    }

    .open-group-btn {
        background: var(--orange);
        border: none;
        border-radius: 40px;
        height: 58px;
        width: 78px;
        cursor: pointer;
        font-size: 20px;
        margin-right: -5px;
    }

    .open-group-btn:hover {
        background: var(--yellow);
        border: 5px solid var(--orange);
    }

    .part-one {
        flex: 2;
        display: flex;
        gap: 10px;
        max-width: 500px;
    }

    .part-two {
        flex: 2;
    }

    .part-three {
        flex: 1;
    }
</style>