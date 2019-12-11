<template>
  <div id="app">
    <div id="home-page" class="full-page">

      <div v-for="task in tasks" class="each-task">
        <i class="far fa-square task-icon" v-if="!task.status" @click="task.status = true"></i>
        <i class="far fa-check-square task-icon"  @click="task.status = false" v-else></i>
        <p class="task-name">{{task.name}}</p>
        <i class="fa fa-trash" @click="deleteTask(task)"></i>
      </div>

      <input type="text" v-model="newTask" @keyup.enter="createTask()">
      <div class="btn btn-primary" @click="createTask()">Criar</div>
      <p>{{batata}}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "home",
  data: function () {
    return {
      tasks: [
        {name: "Investigar", status: true},
        {name: "Programar", status: false},
        {name: "Refatorar", status: false},
      ],
      newTask: "",
      oi: "lalala"
    }
  },
  computed: {
    batata() {
      return this.oi + "oioi"
    }
  },
  methods: {
    createTask() {
      this.tasks.push({name: this.newTask, status: false});
      this.newTask = "";
    },
    deleteTask(task) {
      console.log(task)
      console.log(this.tasks)
      this.tasks = this.tasks.filter((element) => element !== task )
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
