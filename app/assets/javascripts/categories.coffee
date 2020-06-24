# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#閲覧傾向にあるジャンルの円グラフ データはユーザーで記載

window.draw_graph = ->
    ctx = document.getElementById("categoryChart").getContext('2d')
    categoryChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: gon.category_name,
            datasets: [{
                label: '# of Votes',
                data: gon.tendencies,
                backgroundColor: [
                    'rgba(209, 46, 31, 0.6)',
                    'rgba(246, 202, 6, 0.7)',
                    'rgba(187, 212, 26, 0.7)',
                    'rgba(0, 146, 80, 0.7)',
                    'rgba(0, 131, 174, 0.7)'
                    'rgba(50, 97, 171, 0.7)',
                    'rgba(143, 51, 150, 0.7)',
                    'rgba(182, 25, 114, 0.6)'],
                borderWidth: "0",
            }]
        },
        options: {
          title: {
          display: true,
          text: 'ジャンル別！閲覧した診断'
          },
          legend: {
            position: "right",
            align: "center"
            labels: {
              fontSize: 10
              boxWidth: 25
              padding: 10
            }
          }
        }
    })