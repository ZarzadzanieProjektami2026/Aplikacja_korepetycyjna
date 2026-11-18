<script setup>
    import SideMenu from './components/SideMenu.vue';
    import GroupPanel from './components/GroupPanel.vue';
    import StudentPanel from './components/StudentPanel.vue';
</script>

<template>
    <div class="edit-group-container" style="display: none;" > 
        <div class="search-students-panel" style="display: none;">
            <div class="search-panel-header">
                <div class="panel-title">Wyszukaj uczestnika</div>
                <button class="search-close-btn">X</button>
            </div>
            <div class="item-group">
                <span class="icon">()</span>
                <input class="search-student" placeholder="Szukaj"></input>
            </div>
            <div class="student-list">
                <!-- dynamiczne -->
                <StudentPanel icon="()" text="Imię Nazwisko"></StudentPanel>
                
                
            </div>
        </div>

        <div class="edit-group-panel">
            <div class="search-panel-header">
                <div class="panel-title">Stwórz grupę</div>
                <button class="edit-close-btn">X</button>
            </div>
            <div class="items-container">
                <div class="item-group">
                    <span class="icon">()</span>
                    <input class="group-name" placeholder="Nazwa grupy"></input>
                </div>
                <div class="item-group">
                    <span class="icon">()</span>
                    <input class="group-description" placeholder="Opis"></input>
                </div>
                <div class="item-group">
                    <span class="icon">()</span>
                    <input class="group-date" placeholder="Data zajęć"></input>
                </div>
                <div class="item-group students">
                    <div style="display: flex; gap: 10px; flex: 1;">
                        <span class="icon">()</span>
                        <span>Uczestnicy</span>
                    </div>
                    <div class="student-list">
                        <!-- dynamiczne -->
                        <StudentPanel icon="()" text="Imię Nazwisko"></StudentPanel>
                        
                    </div>
                    <button class="add-student-btn">Dodaj uczestnika</button>
                </div>
            </div>
        </div>

    </div>

    <SideMenu></SideMenu>

    <div class="container">
        <div class="page-title">Grupy</div>
        
        <div class="container-hint">
            <span>Nazwa</span>
            <span>Ilość uczniów</span>
        </div>

        <div class="groups-container">
            <!-- dynamiczne -->
            <GroupPanel
                icon="()"
                text="Korepetycje angielski"
                studentNumber="15 uczniów"
            ></GroupPanel>
            <GroupPanel
                icon="()"
                text="Korepetycje angielski"
                studentNumber="15 uczniów"
            ></GroupPanel>
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

    .groups-container {
        gap: 10px;
        display: grid;
    }

    .page-title {
        font-size: 48px;
        color: var(--purple);
        
    }

    .container-hint {
        display: flex;
        justify-content: space-around;
        width: 60%;
        opacity: 60%;
    }

    .edit-group-container {
        background: rgba(128, 128, 128, 0.67);
        z-index: 100;
        width: 100%;
        height: 100vh;
        position: absolute;
        align-content: center;
    }

    .edit-group-panel, .search-students-panel {
        background: var(--beige);
        width: 550px;
        height: 550px;
        border-radius: 60px;
        padding: 10px 30px 30px 30px;
        display: flow;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    .edit-group-panel {
        z-index: 101;
    }
    
    .search-students-panel {
        z-index: 102;
    }

    .search-close-btn, .edit-close-btn {
        position: absolute;
        top: 5%;
        right: 5%;
        border: none;
        cursor: pointer;
        font-size: 25px;
        color: var(--pink);
    }

    .search-close-btn:hover, .edit-close-btn:hover {
        color: var(--purple);
    }

    .panel-title {
        font-size: 38px;
        justify-self: center;
    }

    .items-container {
        gap: 10px;
        display: grid;
    }

    .item-group {
        gap: 10px;
        width: 100%;
        display: flex;
        height: 50px;
        padding: 10px 20px;
        background: var(--yellow);
        border: 5px solid var(--orange);
        border-radius: 40px;
        align-items: center;
    }

    .edit-group-panel .group-name, .edit-group-panel .group-description, .edit-group-panel .group-date, .search-students-panel .search-student{
        border: none;
        border-bottom: 1px solid var(--purple);
        background: none;
        width: 100%;
    }

    .search-students-panel .item-group {
        margin-bottom: 10px;
    }
    .group-name::placeholder, .group-description::placeholder, .group-date::placeholder, .search-students-panel .search-student::placeholder {
        color: var(--purple);
    }

    .item-group.students {
        height: 270px;
        align-items: baseline;
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .student-list {
        gap: 5px;
        display: grid;
        flex: 3;
        width: 100%;
        overflow-y: auto;
        max-height: 400px;
    }

    .add-student-btn {
        background: var(--orange);
        border: none;
        border-radius: 40px;
        min-height: 58px;
        width: 100%;
        cursor: pointer;
        flex: 1;
    }

    .add-student-btn:hover {
        background: var(--yellow);
        border: 5px solid var(--orange);
    }


</style>