<div class="navbar navbar-expand-sm navbar-light navbar-lewagon">
  <div class="container-fluid">
    <%= link_to "#", class: "navbar-brand" do %>
      <%= image_tag "https://raw.githubusercontent.com/lewagon/fullstack-images/master/uikit/logo.png" %>
    <% end %>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto">
        <% if user_signed_in? %>
          <li class="nav-item active">
            <%= link_to "Home", "/", class: "nav-link" %>
          </li>
          <li class="nav-item active">
            <%= link_to "Sources", sources_path, class: "nav-link" %>
          </li>
          <li class="nav-item dropdown">
          <a href="#" class="avatar" id="navbarDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <%= image_tag "https://kitt.lewagon.com/placeholder/users/ssaunier", class: "avatar", alt: "dropdown menu" %>
          </a>
            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
              <%= link_to "Action", "#", class: "dropdown-item" %>
              <%= link_to "Another action", "#", class: "dropdown-item" %>
              <%= link_to "Log out", destroy_user_session_path, data: {turbo_method: :delete}, class: "dropdown-item" %>
            </div>
          </li>
        <% else %>
          <li class="nav-item">
            <%= link_to "Login", new_user_session_path, class: "nav-link" %>
          </li>
        <% end %>
      </ul>
    </div>
  </div>
</div>
