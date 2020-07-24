<template>
  <div id="app">
    <div class="home">
      <div class="logo">
        <h1>Shrinkr</h1>
      </div>
      <div class="url-input">
        <input type="text" placeholder="Enter url here">
      </div>
      <div class="shrink-button">
        <button> Shrink </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {

}
</script>

<style scoped lang="scss">
.home {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;

  background-color: #333333;
  height: 100vh;
  width: 100vw;

  .logo {
    h1 {
      font-size: 189px;
      color: white;
    }
  }

  .url-input {
    input {
      font-size: 30px;
      border-radius: 50px;
      padding: 15px 25px;

      &:focus {
        outline: none;
      }
    }
  }

  .shrink-button {
    button {
      background-color: #2D9CDB;
      color: white;
      font-size: 30px;
      border-radius: 50px;
      min-width: 150px;
      border: none;
    }
  }
}





</style>
