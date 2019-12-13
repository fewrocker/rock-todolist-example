<template>
  <div id="app">
    <div id="home-page" class="full-page">

      <div v-for="task in tasks" class="each-task">
        <i class="far fa-square task-icon" v-if="!task.status" @click="updateTask(task.id)"></i>
        <i class="far fa-check-square task-icon"  @click="updateTask(task.id)" v-else></i>
        <p class="task-name">{{task.name}}</p>
        <i class="fa fa-trash" @click="deleteTask(task.id)"></i>
      </div>

      <input type="text" v-model="newTask" @keyup.enter="createTask()">
      <div class="btn btn-primary" @click="createTask()">Criar</div>
    </div>
  </div>
</template>

<script>
export default {
  name: "home",
  data: function () {
    return {
      tasks: [],
      newTask: "",
    }
  },
  async mounted() {
    const response = await axios.get("/client/tasks");
    console.log(response)
    this.tasks = response.data.tasks;
  },
  methods: {
    async createTask() {
      const params = { name: this.newTask, status: false };
      const response = await axios.post("/client/tasks", params);

      this.tasks.push(response.data.task);
      this.newTask = "";
    },
    async updateTask(id) {
      const response = await axios.patch(`/client/tasks/${id}`);
      const index = this.tasks.findIndex((el) => el.id === id );
      console.log(response.data)
      this.$set(this.tasks, index, response.data.task);
    },
    async deleteTask(id) {
      const response = await axios.delete(`/client/tasks/${id}`);
      const index = this.tasks.findIndex((el) => el.id === id );
      this.tasks.splice(index, 1);
    }
  }
}
</script>

<style lang="scss" scoped>
  #home-page {
    background: rgba(240,240,240,1);
    color: black;
  }

  .color-red {
    color: red;
  }

  .color-blue {
    color: blue;
  }

  .each-task {
    display: flex;
    width: 300px;
  }
  .task-icon {
    flex: 0 0 20%;
    font-size: 24px;
    &:hover {
      cursor: pointer;
      color: rgba(80,80,80,1);
    };
  }
  .task-name {
    flex: 0 0 30%;
  }
  .fa-trash {
    flex: 0 0 20%;
    &:hover {
      cursor: pointer;
      color: rgba(80,80,80,1);
    };
  }
</style>
