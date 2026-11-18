<script setup lang="ts">
    import SideMenu from '@/components/SideMenu.vue';
    import StatisticPanel from '@/components/StatisticPanel.vue';
</script>

<template>
    <SideMenu></SideMenu>
    <div class="container">
        <div class="page-title">Statystyki</div>

        <div class="statistic-container">
            <div class="box-container first">
                <div class="box-title">Liczba uczniów</div> <!--Dla ucznia Liczba ukończonych zadań-->
                <div class="big-number">50</div>
            </div>

            <div class="box-container second">
                <div class="box-title">Średni wynik</div>
                <div class="big-number">50</div>
            </div>

            <div class="box-container third"></div>
        </div>

        <div class="statistic-container">
            <div class="box-container full">
                <div class="box-title">Statystyki studentów</div> <!--Dla ucznia Statystyki zadań-->
                
                <div class="container-hint statistics">
                    <span>Imię i nazwisko</span> <!-- Nazwa -->
                    <span>Ilość wykonanych zadań</span> <!-- Wynik -->
                    <span>Średni wynik</span> <!-- Termin oddania -->
                </div>
                <div class="student-statistics-container">
                    <StatisticPanel
                        icon="()"
                        title="Imie Nazwisko"
                        firstStatistic="18/36"
                        secondStatistic="50%"
                    ></StatisticPanel>

                </div>
            </div>
        </div>
    </div>
</template>

<style>
    *, body {
        color: var(--purple);
        font-size: 18px;
        font-family: 'Sour Gummy';

    }

    .container {
        background: var(--beige);
        margin-left: 65px;
        width: calc(100%-65px);
        min-height: 100vh;
        padding: 30px;
        display: block;
        overflow-y: auto;
    }

    .page-title {
        font-size: 48px;
        color: var(--purple);
        
    }

    .statistic-container {
        display: flex;
        gap: 10px;
    }

    .big-number {
        font-size: 58px;
    }

    .box-container {
        width: 300px;
        min-height: 200px;
        margin-top: 30px;
        display: flow;
        gap: 10px;
        border-radius: 30px;
    } 

    .box-container.first {
        flex: 1;
        background: var(--light-pink);
        border: 5px solid var(--pink);
    }

    .box-container.second {
        flex: 1;
        background: var(--light-pink);
        border: 5px solid var(--pink);
    }

    .box-container.third {
        flex: 2;
        background: var(--light-pink);
        border: 5px solid var(--pink);
    }

    .box-container.full {
        flex: 1;
        background: var(--light-pink);
        border: 5px solid var(--pink);
    }

    .box-title {
        margin-left: 30px;
        font-size: 20px;
    }

    .container-hint.statistics {
        display: flex;
        justify-content: space-around;
        opacity: 60%;
    }

    .student-statistics-container {
        overflow-y: auto;
        padding: 0px 10px 10px 10px;
        min-height: 200px;
        gap: 5px;
        display: grid;
        max-height: 500px;
    }
</style>