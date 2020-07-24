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
  font-family: SquadaOne;

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
      font-family: SquadaOne;

      border-radius: 50px;

      padding: 15px 25px;

      &:focus {
        outline: none;
      }
    }
  }

  .shrink-button {
    button {
      min-width: 150px;

      color: white;
      background-color: #2D9CDB;

      border-radius: 50px;
      border: none;

      font-family: SquadaOne;
      font-size: 30px;
    }
  }
}





</style>
