require 'aws-sdk'

unless Capistrano::Configuration.respond_to?(:instance)
  abort "capistrano/ec2elb requires Capistrano >= 2"
end

module Capistrano
  class Configuration
    module ELBGroups

      def elb_group(which, *args)
        @elb ||= AWS::ELB.new

        AWS.memoize do
          @elb.load_balancers[which].instances.each do |instance|
            server(instance.dns_name, *args) if instance.status == :running
          end
        end
      end

    end

    include ELBGroups
  end
end

