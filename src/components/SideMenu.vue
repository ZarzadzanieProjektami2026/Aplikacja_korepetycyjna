<script setup lang="ts">
import { useRouter } from 'vue-router'

const router = useRouter()

</script>
<template>
    <div class="side-menu">
        <button class="icon-btn" id="btn-account">()</button>
        <div class="btn-name">Konto</div>

        <button class="icon-btn" id="btn-tasks">()</button>
        <div class="btn-name">Zadania</div>

        <button class="icon-btn" id="btn-groups" @click="router.push('/grupy')">()</button>
        <div class="btn-name">Grupy</div>

        <button class="icon-btn" id="btn-calendar" @click="router.push('/kalendarz')">()</button>
        <div class="btn-name">Kalendarz</div>

        <button class="icon-btn" id="btn-statistics" @click="router.push('/statystyki')">()</button>
        <div class="btn-name">Statystyki</div>
    </div>

</template>


<style>
    * {
        font-family: 'Sour Gummy';
        color: var(--purple);
    }
    .side-menu {
        background: var(--green);
        height: 100%;
        width: 65px;
        position: fixed;
        display: grid;
        justify-items: center;
        align-content: center;
    }

    .side-menu .icon-btn {
        height: 48px;
        width: 48px;
        border-radius: 100%;
        border: none;
        background: var(--beige);
        cursor: pointer;
    }

    .side-menu .icon-btn:hover {
        background: var(--green);
        border: 5px solid var(--beige);
    }

    .btn-name {
        font-size: 13px;
        margin-bottom: 10px;
        margin-top: 5px;
       
    }
</style>