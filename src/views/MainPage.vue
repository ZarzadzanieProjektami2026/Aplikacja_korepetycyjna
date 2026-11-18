<script setup>
  import SideMenu from './components/SideMenu.vue';
  import IconButton from './components/IconButton.vue';
  import TaskInProgress from './components/TaskInProgress.vue';
  import NotificationPanel from './components/NotificationPanel.vue';
</script>

<template>

  <SideMenu></SideMenu>

  <div class="container">
    <div class="left-container">
      <div class="welcome-text">Witaj ponownie!</div>

      <div class="box-container">
        <button class="btn-wide" id="btn-tasks">Zadania</button>
         <button class="btn-wide" id="btn-statistics">Statystyki</button>
      </div>

      <div class="box-container group">
        <div class="box-title">Moje Grupy</div>
        <!--dynamiczne dodawanie, tu dla przykładu tylko jak przyciski wyglądają-->
        <div class="groups-container">
          <IconButton icon="()" text="Korepetycje"></IconButton>
          <IconButton icon="()" text="Korepetycje"></IconButton>
          <IconButton icon="()" text="Korepetycje"></IconButton>
          <IconButton icon="()" text="Korepetycje"></IconButton>
          <IconButton icon="()" text="Korepetycje"></IconButton>

        </div>
      </div>

      <div class="box-container tasks">
        <div class="box-title">Zadania</div>
        <div class="container-hint tasks">
          <span>Nazwa</span>
          <span>Wykonanie</span>
          <span>Czas do końca</span>
        </div>
        <!--też dodawanie dynamiczne ?-->
        <div class="tasks-container">
          <TaskInProgress 
            taskIcon="()"
            title="Historia-średniowiecze"
            progressIcon="()"
            progress="50%"
            timeIcon="()"
            timeLeft="1 dzień"
          ></TaskInProgress>
          <TaskInProgress 
            taskIcon="()"
            title="Historia-średniowiecze"
            progressIcon="()"
            progress="50%"
            timeIcon="()"
            timeLeft="1 dzień"
          ></TaskInProgress>
          <TaskInProgress 
            taskIcon="()"
            title="Historia-średniowiecza"
            progressIcon="()"
            progress="50%"
            timeIcon="()"
            timeLeft="1 dzień"
          ></TaskInProgress>
          <TaskInProgress 
            taskIcon="()"
            title="Historia-średniowiecze"
            progressIcon="()"
            progress="50%"
            timeIcon="()"
            timeLeft="1 dzień"
          ></TaskInProgress>
        </div>
      </div>
    </div>

    <div class="right-container">
      <div class="box-container calendar">
        <div class="box-title">Kalendarz</div>
      </div>


      <div class="box-container notifications">
        <div class="container-hint notifications">
          <span>Nazwa</span>
          <span>Data</span>
          <span>Godzina</span>
        </div>
        <!-- też dynamiczne ? -->
        <NotificationPanel
          icon="()"
          title="Spotkanie"
          date="03.11"
          time="13.20"
        ></NotificationPanel>

        <NotificationPanel
          icon="()"
          title="Spotkanie"
          date="03.11"
          time="13.20"
        ></NotificationPanel>

      </div>
    </div>
    
    
  </div>

  
</template>

<style scoped>
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
    display: flex;
    overflow-y: auto;
  }

  .welcome-text {
    font-size: 48px;
    color: var(--pink);
  }

  .left-container {
    width: 60%;
    height: 100%;
    display: block;
    margin-right: 15px;
  }

  .right-container {
    width: 40%;
    height: 100%;
    margin-left: 15px;
  }

  .box-container {
    width: 100%;
    min-height: 50px;
    margin-top: 30px;
    display: flex;
    gap: 10px;
    border-radius: 30px;
  }

  .box-container.group {
    background: var(--yellow);
    display: grid;
    padding: 10px;
  }

  .box-container.tasks {
    background: var(--light-green);
    display: grid;
    padding: 10px;
  }
  
  .box-container.calendar {
    background: var(--light-blue);
    padding: 10px;
    min-height: 400px;
  }

  .box-container.notifications {
    display: grid;
  }

  .btn-wide {
    border-radius: 40px;
    height: 50px;
    justify-content: center;
    align-content: center;
    border: none;

  }

  #btn-tasks, #btn-statistics {
    background: var(--light-pink);
    flex: 1;
    cursor: pointer;
  }

  #btn-tasks:hover, #btn-statistics:hover {
    border-bottom: 5px solid var(--purple);
  }

  .box-title {
    margin-left: 30px;
    font-size: 20px;
  }
  
  .groups-container {
    display: grid;
    width: 100%;
    grid-template-columns: repeat(2, 1fr);
    gap: 10px;
    max-height: 170px;
    overflow-y: auto;
  }

  .tasks-container {
    gap: 10px;
    display: grid;
  }

  .container-hint {
    display: flex;
    justify-content: space-between;
    margin-bottom: -10px;
    opacity: 60%;
  }

  .container-hint.notifications {
    padding: 0px 20px 0px 60px;
  }

  .container-hint.tasks {
    justify-content: space-evenly;
  }

</style>
