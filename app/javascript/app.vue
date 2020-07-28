
<template>
  <div id="app">
    <div class="home">
      <div class="logo">
        <h1>Shrinkr</h1>
      </div>
      <div class="url-input">
        <input type="text" placeholder="Enter url here" v-model="url">
      </div>
      <shrink-button :status="status" :on-shrink="handleShrink" />
    </div>
  </div>
</template>

<script>
import ShrinkButton from './components/ShrinkButton.vue';
import { shrinkUrl } from './service';

export default {
  components:{
    'shrink-button': ShrinkButton
  }
  ,
  methods: {
    async handleShrink() {
      this.status = "shrinking";

      try {
        const newUrl = await shrinkUrl(this.url);
        this.url = newUrl;

        this.status = "completed";
      }
      catch {
        this.status = "failed";
      }
    }
  },

  data() {
    return {
      url: undefined,
      status: "idle",
    }
  }
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
    margin-bottom: 64px;

    h1 {
      font-size: 120px;
      font-weight: normal;

      color: white;
      margin: 0;
    }
  }

  .url-input {
    input {
      font-size: 30px;
      font-family: SquadaOne;

      border-radius: 50px;

      padding: 15px 25px;

      min-width: 600px;

      margin-bottom: 16px;

      &:focus {
        outline: none;
      }
    }
  }
}





</style>
