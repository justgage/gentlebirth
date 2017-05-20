var vm = new Vue({
   el: '#header',
  data: {
     menuOpen: false,
  },
  created: function () {
    console.log('Vue works')
  },
  methods: {
     toggleMenu: function() {
        this.menuOpen = !this.menuOpen;
     }
  }
})
