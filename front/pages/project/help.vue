<template>
  <div>
    <div id="app" class="container mt-5">
      <h1>{{ message }}</h1>
      <table class="table table-striped table-bordered">
        <thead>
          <tr class="thead-dark">
            <th>ID</th>
            <th>NAME</th>
            <th>ORDER</th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="(list, index) in lists"
            :key="index"
            draggable
            @dragstart="dragList($event, index)"
            @drop="dropList($event, index)"
            @dragover.prevent
            @dragenter.prevent
          >
            <td>{{ list.id }}</td>
            <td>{{ list.name }}</td>
            <td>{{ list.order }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      message: 'ストック一覧',
      lists: [
        {
          id: 1,
          name: 'ProductA',
          order: 1
        },
        {
          id: 2,
          name: 'ProductB',
          order: 2
        },
        {
          id: 3,
          name: 'ProductC',
          order: 3
        },
        {
          id: 4,
          name: 'ProductD',
          order: 4
        },
        {
          id: 5,
          name: 'ProductE',
          order: 5
        }
      ]
    }
  },
  methods: {
    dragList (event, dragIndex) {
      event.dataTransfer.effectAllowed = 'move'
      event.dataTransfer.dropEffect = 'move'
      event.dataTransfer.setData('drag-index', dragIndex)
    },
    dropList (event, dropIndex) {
      const dragIndex = event.dataTransfer.getData('drag-index')
      const deleteList = this.lists.splice(dragIndex, 1)
      this.lists.splice(dropIndex, 0, deleteList[0])
      this.lists.map((list, index) => {
        list.order = index + 1
      })
    }
  }
}
</script>

<style scoped>
table {
  border-collapse: collapse;
  width: 100%;
}
td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
th {
  color:white;
  background-color: #272a2c;
}
</style>
