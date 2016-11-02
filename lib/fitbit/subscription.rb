module Fitbit
  class Client

    # The Add Subscription endpoint registers the application to send notifications when the
    # user Fitbit data changes. The endpoint response includes a summary of the subscription
    # @param [String] user_id: The encoded ID of the user. Use "-" (dash) for current logged-in user.
    # @param [String] collection_path: This is the resource of the collection to receive notifications
    #                                  from (foods, activities, sleep, or body). If not present,
    #                                  subscription will be created for all collections.
    # @param [String] subscription-id: unique id of the subscription. This is mandatory
    # @return [Hash] response data from Fitbit API
    def add_subscription(user_id: '-', collection_path: nil, subscription_id: nil)
      raise StandardError if !subscription_id
      if collection_path
        return post("#{API_URI}/user/#{user_id}/#{collection_path}/apiSubscriptions/#{subscription_id}.json")
      else
        return post("#{API_URI}/user/#{user_id}/apiSubscriptions/#{subscription_id}.json")
      end
    end

    # The Delete Subscription endpoint updates the app to stop sending notifications when the
    # user Fitbit data changes. The endpoint response includes a summary of the subscription
    # @param [String] user_id: The encoded ID of the user. Use "-" (dash) for current logged-in user.
    # @param [String] collection_path: This is the resource of the collection to receive notifications
    #                                  from (foods, activities, sleep, or body). If not present,
    #                                  subscription will be created for all collections.
    # @param [String] subscription-id: unique id of the subscription. This is mandatory
    # @return [Hash] response data from Fitbit API
    def delete_subscription(user_id: '-', collection_path: nil, subscription_id: nil)
      raise StandardError if !subscription_id
      if collection_path
        return delete("#{API_URI}/user/#{user_id}/#{collection_path}/apiSubscriptions/#{subscription_id}.json")
      else
        return delete("#{API_URI}/user/#{user_id}/apiSubscriptions/#{subscription_id}.json")
      end
    end

  end
end

