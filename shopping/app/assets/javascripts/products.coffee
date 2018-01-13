# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(() ->
  $(".amount_button").click (e) ->
    amount = $('#shopping_cart_amount')
    num = parseInt(amount.val()) + parseInt(e.target.value)
    max_num = $('#amount').val()
    if num < 0
      amount.val(0)
    else if num > max_num
      amount.val(max_num)
    else
      amount.val(num)
    e.preventDefault()
    return false
)