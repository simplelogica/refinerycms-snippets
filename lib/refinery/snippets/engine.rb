require 'refinerycms-snippets'

module Refinery
  module Snippets
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery
      engine_name :refinery_snippets

      config.before_initialize do
        require 'extensions/page_extensions'
      end

      initializer "register refinery_snippets plugin", :after => :set_routes_reloader do |app|

        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinery_snippets"
          plugin.url = proc {Refinery::Core::Engine.routes.url_helpers.admin_snippets_path}
          plugin.menu_match = %r{refinery/snippets(_page_parts)?$}
          plugin.activity = {
                               :class_name => :'refinery/snippet',
                               :title => 'title'
                             }
        end
      end

      config.to_prepare do
        Refinery::PagePart.module_eval do
          has_many :snippet_page_parts, :dependent => :destroy
          has_many :snippets, :through => :snippet_page_parts, :order => 'position ASC'
        end
        Refinery::Page.send :include, Extensions::Page
        Refinery::Pages::PagePartSectionPresenter.class_eval do
          def initialize(page_part)
            super()
            self.id = convert_title_to_id(page_part.title) if page_part.title

            content = ""
            content += page_part.snippets.before.map{ |snippet| content_or_render_of(snippet) }.join
            content += page_part.body
            content += page_part.snippets.after.map{ |snippet| content_or_render_of(snippet) }.join
            self.fallback_html = content.html_safe
          end

          def content_or_render_of(snippet)
            snippet.template? ? render(:file => snippet.template_path) : snippet.body
          end
        end
      end

      config.after_initialize do
        ::Refinery::Pages::Tab.register do |tab|
          tab.name = "snippets"
          tab.partial = "/refinery/admin/pages/tabs/snippets"
        end

        Refinery.register_engine(Refinery::Snippets)
      end
    end
  end
end
