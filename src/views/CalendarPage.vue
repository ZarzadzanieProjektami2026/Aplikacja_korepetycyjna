<script setup lang="ts">
import { ref, computed, onMounted, watch } from 'vue'
import SideMenu from '@/components/SideMenu.vue'

interface CalendarEvent {
  id: number
  date: string
  title: string
  color: 'blue' | 'orange' | 'pink'
}
const API_URL = 'http://localhost:3000/api/events' //ADRES API
const currentDate = ref(new Date())
const events = ref<CalendarEvent[]>([])
const isLoading = ref(false)
const errorMessage=ref('')

const weekDays = ['Poniedziałek', 'Wtorek', 'Środa', 'Czwartek', 'Piątek', 'Sobota', 'Niedziela']

const monthNames = [
  'Styczeń', 'Luty', 'Marzec', 'Kwiecień', 'Maj', 'Czerwiec',
  'Lipiec', 'Sierpień', 'Wrzesień', 'Październik', 'Listopad', 'Grudzień'
]

const currentMonthName = computed(() => monthNames[currentDate.value.getMonth()])
async function fetchEvents(){
    isLoading.value=true
    errorMessage.value=''
    const year=currentDate.value.getFullYear()
    const month=currentDate.value.getMonth()+1

    try{
        //rok i miesiac jako parametry zapytania
        const response=await fetch(`${API_URL}?year=${year}&month=${month}`, {
            headers: {
                'Content-Type':'application/json',
            }
        })

        if (!response.ok) {
             throw new Error(`Błąd serwera: ${response.status}`)
         }

        const data: CalendarEvent[] = await response.json()
        events.value = data
    } catch (err) {
    console.error('Nie udalo sie pobrac danych:', err)
    errorMessage.value = 'Blad ladowania z serwera'
    events.value = []
    } finally {
        isLoading.value = false

    }
}

onMounted(() => {
  fetchEvents()
})


function prevMonth() {
  currentDate.value = new Date(
    currentDate.value.getFullYear(),
    currentDate.value.getMonth() - 1,
    1
  )
}

function nextMonth() {
  currentDate.value = new Date(
    currentDate.value.getFullYear(),
    currentDate.value.getMonth() + 1,
    1
  )
}

const calendarCells = computed(() => {
  const year = currentDate.value.getFullYear()
  const month = currentDate.value.getMonth()

  const firstDayOfMonth = new Date(year, month, 1).getDay()
  const startOffset = firstDayOfMonth === 0 ? 6 : firstDayOfMonth - 1
  const daysInMonth = new Date(year, month + 1, 0).getDate()

  const cells: Array<{ day: number | null; dateStr: string }> = []

  for (let i = 0; i < startOffset; i++) {
    cells.push({ day: null, dateStr: '' })
  }

  for (let day = 1; day <= daysInMonth; day++) {
    const m = String(month + 1).padStart(2, '0')
    const d = String(day).padStart(2, '0')
    cells.push({ day, dateStr: `${year}-${m}-${d}` })
  }

  return cells
})

function getEventsForDate(dateStr: string) {
  return events.value.filter((e) => e.date === dateStr)
}
</script>

<template>
  <SideMenu />

  <div class="container">
    <div class="calendar-header">
      <div class="page-title">Kalendarz</div>

      <div class="month-switcher">
        <button class="arrow-btn" @click="prevMonth">←</button>
        <span class="month-name">{{ currentMonthName }}</span>
        <button class="arrow-btn" @click="nextMonth">→</button>
      </div>
    </div>

    <div class="weekdays-row">
      <div v-for="day in weekDays" :key="day" class="weekday-label">
        {{ day }}
      </div>
    </div>

    <div class="calendar-board">
      <div
        v-for="(cell, index) in calendarCells"
        :key="index"
        class="day-card"
        :class="{ 'empty-card': !cell.day }"
      >
        <template v-if="cell.day">
          <div class="day-number">{{ String(cell.day).padStart(2, '0') }}</div>

          <div class="events-list">
            <div
              v-for="ev in getEventsForDate(cell.dateStr)"
              :key="ev.id"
              class="event-pill"
              :class="`pill-${ev.color}`"
            >
              {{ ev.title }}
            </div>
          </div>
        </template>
      </div>
    </div>
  </div>
</template>
<style scoped>
.container {
  background: var(--beige);
  margin-left: 65px;
  width: calc(100% - 65px);
  min-height: 100vh;
  padding: 25px 35px;
  font-family: 'Sour Gummy', sans-serif;
  color: var(--purple);
  box-sizing: border-box;
}

.calendar-header {
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  align-items: center;
  margin-bottom: 20px;
  gap: 15px;
}

.page-title {
  font-size: clamp(32px, 4vw, 48px);
  font-weight: bold;
  color: var(--blue);
  justify-self: start;
}

.month-switcher {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 15px;
  font-size: clamp(24px, 3vw, 34px);
  color: var(--purple);
  white-space: nowrap;
}

.arrow-btn {
  background: none;
  border: none;
  font-size: 30px;
  cursor: pointer;
  color: var(--purple);
  font-family: inherit;
  transition: transform 0.15s;
}

.arrow-btn:hover {
  transform: scale(1.2);
}

.weekdays-row {
  display: grid;
  grid-template-columns: repeat(7, minmax(0, 1fr));
  text-align: center;
  margin-bottom: 8px;
  padding: 0 12px;
  gap: 8px;
}

.weekday-label {
  font-size: 15px;
  color: var(--purple);
  overflow: hidden;
  text-overflow: ellipsis;
}

.calendar-board {
  background: var(--light-blue);
  border: 3px solid var(--blue);
  border-radius: 28px;
  padding: 12px;
  display: grid;
  grid-template-columns: repeat(7, minmax(0, 1fr));
  gap: 10px;
}

.day-card {
  background: var(--beige);
  border: 2.5px solid var(--blue);
  border-radius: 20px;
  aspect-ratio: 1.25 / 1;
  min-height: 95px;
  padding: 10px 12px;
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.empty-card {
  background: transparent;
  border: none;
}

.day-number {
  font-size: 16px;
  color: var(--blue);
}

.events-list {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.event-pill {
  font-size: 13px;
  padding: 4px 10px;
  border-radius: 12px;
  text-align: center;
  color: var(--purple);
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.pill-blue {
  background: var(--light-blue);
}

.pill-orange {
  background: var(--orange);
}

.pill-pink {
  background: var(--pink);
}
</style>
