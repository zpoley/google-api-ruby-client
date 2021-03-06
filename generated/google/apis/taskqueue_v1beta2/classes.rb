# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module TaskqueueV1beta2
      
      # 
      class Task
        include Google::Apis::Core::Hashable
      
        # Time (in seconds since the epoch) at which the task was enqueued.
        # Corresponds to the JSON property `enqueueTimestamp`
        # @return [String]
        attr_accessor :enqueue_timestamp
      
        # Name of the task.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The kind of object returned, in this case set to task.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Time (in seconds since the epoch) at which the task lease will expire. This
        # value is 0 if the task isnt currently leased out to a worker.
        # Corresponds to the JSON property `leaseTimestamp`
        # @return [String]
        attr_accessor :lease_timestamp
      
        # A bag of bytes which is the task payload. The payload on the JSON side is
        # always Base64 encoded.
        # Corresponds to the JSON property `payloadBase64`
        # @return [String]
        attr_accessor :payload_base64
      
        # Name of the queue that the task is in.
        # Corresponds to the JSON property `queueName`
        # @return [String]
        attr_accessor :queue_name
      
        # The number of leases applied to this task.
        # Corresponds to the JSON property `retry_count`
        # @return [Fixnum]
        attr_accessor :retry_count
      
        # Tag for the task, could be used later to lease tasks grouped by a specific tag.
        # Corresponds to the JSON property `tag`
        # @return [String]
        attr_accessor :tag
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enqueue_timestamp = args[:enqueue_timestamp] unless args[:enqueue_timestamp].nil?
          @id = args[:id] unless args[:id].nil?
          @kind = args[:kind] unless args[:kind].nil?
          @lease_timestamp = args[:lease_timestamp] unless args[:lease_timestamp].nil?
          @payload_base64 = args[:payload_base64] unless args[:payload_base64].nil?
          @queue_name = args[:queue_name] unless args[:queue_name].nil?
          @retry_count = args[:retry_count] unless args[:retry_count].nil?
          @tag = args[:tag] unless args[:tag].nil?
        end
      end
      
      # 
      class TaskQueue
        include Google::Apis::Core::Hashable
      
        # ACLs that are applicable to this TaskQueue object.
        # Corresponds to the JSON property `acl`
        # @return [Google::Apis::TaskqueueV1beta2::TaskQueue::Acl]
        attr_accessor :acl
      
        # Name of the taskqueue.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The kind of REST object returned, in this case taskqueue.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The number of times we should lease out tasks before giving up on them. If
        # unset we lease them out forever until a worker deletes the task.
        # Corresponds to the JSON property `maxLeases`
        # @return [Fixnum]
        attr_accessor :max_leases
      
        # Statistics for the TaskQueue object in question.
        # Corresponds to the JSON property `stats`
        # @return [Google::Apis::TaskqueueV1beta2::TaskQueue::Stats]
        attr_accessor :stats
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @acl = args[:acl] unless args[:acl].nil?
          @id = args[:id] unless args[:id].nil?
          @kind = args[:kind] unless args[:kind].nil?
          @max_leases = args[:max_leases] unless args[:max_leases].nil?
          @stats = args[:stats] unless args[:stats].nil?
        end
        
        # ACLs that are applicable to this TaskQueue object.
        class Acl
          include Google::Apis::Core::Hashable
        
          # Email addresses of users who are "admins" of the TaskQueue. This means they
          # can control the queue, eg set ACLs for the queue.
          # Corresponds to the JSON property `adminEmails`
          # @return [Array<String>]
          attr_accessor :admin_emails
        
          # Email addresses of users who can "consume" tasks from the TaskQueue. This
          # means they can Dequeue and Delete tasks from the queue.
          # Corresponds to the JSON property `consumerEmails`
          # @return [Array<String>]
          attr_accessor :consumer_emails
        
          # Email addresses of users who can "produce" tasks into the TaskQueue. This
          # means they can Insert tasks into the queue.
          # Corresponds to the JSON property `producerEmails`
          # @return [Array<String>]
          attr_accessor :producer_emails
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @admin_emails = args[:admin_emails] unless args[:admin_emails].nil?
            @consumer_emails = args[:consumer_emails] unless args[:consumer_emails].nil?
            @producer_emails = args[:producer_emails] unless args[:producer_emails].nil?
          end
        end
        
        # Statistics for the TaskQueue object in question.
        class Stats
          include Google::Apis::Core::Hashable
        
          # Number of tasks leased in the last hour.
          # Corresponds to the JSON property `leasedLastHour`
          # @return [String]
          attr_accessor :leased_last_hour
        
          # Number of tasks leased in the last minute.
          # Corresponds to the JSON property `leasedLastMinute`
          # @return [String]
          attr_accessor :leased_last_minute
        
          # The timestamp (in seconds since the epoch) of the oldest unfinished task.
          # Corresponds to the JSON property `oldestTask`
          # @return [String]
          attr_accessor :oldest_task
        
          # Number of tasks in the queue.
          # Corresponds to the JSON property `totalTasks`
          # @return [Fixnum]
          attr_accessor :total_tasks
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @leased_last_hour = args[:leased_last_hour] unless args[:leased_last_hour].nil?
            @leased_last_minute = args[:leased_last_minute] unless args[:leased_last_minute].nil?
            @oldest_task = args[:oldest_task] unless args[:oldest_task].nil?
            @total_tasks = args[:total_tasks] unless args[:total_tasks].nil?
          end
        end
      end
      
      # 
      class Tasks
        include Google::Apis::Core::Hashable
      
        # The actual list of tasks returned as a result of the lease operation.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::TaskqueueV1beta2::Task>]
        attr_accessor :items
      
        # The kind of object returned, a list of tasks.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] unless args[:items].nil?
          @kind = args[:kind] unless args[:kind].nil?
        end
      end
      
      # 
      class Tasks2
        include Google::Apis::Core::Hashable
      
        # The actual list of tasks currently active in the TaskQueue.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::TaskqueueV1beta2::Task>]
        attr_accessor :items
      
        # The kind of object returned, a list of tasks.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] unless args[:items].nil?
          @kind = args[:kind] unless args[:kind].nil?
        end
      end
    end
  end
end
