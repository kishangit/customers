import consumer from "./consumer"

const customerRoomChannel = consumer.subscriptions.create("CustomerRoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the customer room!");
  },

  disconnected() {
    console.log("DisConnected from the customer room!");
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if (data.response == '200') {
      success_message.innerHTML = "<button type='button' class='close' onclick='hideAlert(this)'>&times;</button>";
      success_message.innerHTML = success_message.innerHTML + 'Import process completed.';
      var invalid_count = data.invalid_customers_count;
      if (invalid_count > 0) {
        success_message.innerHTML = success_message.innerHTML + `<b>There are ${invalid_count} invalid records.</b>`;
      }
      success_message.style.display = 'block';
      this.display_data(JSON.parse(data.customers));
      document.getElementById("attachment_file").value = "";
    } else {
      error_message.innerHTML = "<button type='button' class='close' onclick='hideAlert(this)'>&times;</button>";
      error_message.innerHTML = error_message.innerHTML + data.error;
      error_message.style.display = 'block';
      loader.style.display = 'none';
      document.getElementById("attachment_file").value = "";
    }
    // Called when there's incoming data on the websocket for this channel
  },

  display_data(data) {
    var elem = document.getElementById("main_content");
    elem.remove();
    var tbody = document.createElement("TBODY");
    tbody.id = 'main_content';
    $('#customers_table').append(tbody);
    data.map(function(x){
      var tr = document.createElement("TR");
      var customer_id = document.createElement("TD");
      customer_id.innerText = x['customer_id'];
      var tr = document.createElement("TR");

      var first_name = document.createElement("TD");
      first_name.innerText = x['first_name'];

      var last_name = document.createElement("TD");
      last_name.innerText = x['last_name'];
      
      var email = document.createElement("TD");
      if ( x['email'] ) {
        email.innerHTML = x['email'].split(',').join('<br />');
      } else {
        email.innerHTML = x['email'];
      }

      var phone = document.createElement("TD");
      if ( x['phone'] ) {
        phone.innerHTML = x['phone'].split(',').join('<br />');
      } else {
        phone.innerHTML = x['phone'];
      }

      tr.append(customer_id);
      tr.append(first_name);
      tr.append(last_name);
      tr.append(email);
      tr.append(phone);

      $('tbody').append(tr);
    })
    loader.style.display = 'none';
  }
});

export default customerRoomChannel;