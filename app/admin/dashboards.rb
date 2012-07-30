ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
    section "Recent Users" do
      table_for User.order("created_at desc").limit(25) do
        column :id do |user|
          link_to(user.id, admin_user_path(user))
        end
        column :nickname
        column :created_at
        column :num_doghouses do |user|
          user.doghouses.count
        end
      end
      strong { link_to "View All Users", admin_users_path }
    end
    
    section "Recent Doghouses" do
      table_for Doghouse.order("created_at desc").limit(25) do
        column :id do |doghouse|
          link_to(doghouse.id, admin_doghouse_path(doghouse))
        end
        column :user do |doghouse|
          link_to(doghouse.user.nickname, admin_user_path(doghouse.user))
        end
        column :created_at
        column :duration_minutes
        column :is_released
      end
      strong { link_to "View All Doghouses", admin_doghouses_path }
    end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end