class ApplicationFirebaseModel
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Serializers::JSON

  attribute :id, :string

  class << self
    def client
      $firebase
    end

    def collection_name
      model_name.collection
    end

    def all
      response = client.get(collection_name)
      return [] unless response.success? && response.body

      response.body.map do |id, attributes|
        new(attributes.merge(id: id))
      end
    end

    def find(id)
      response = client.get("#{collection_name}/#{id}")
      return nil unless response.success? && response.body

      new(response.body.merge(id: id))
    end

    def create(attributes)
      new(attributes).tap(&:save)
    end
  end

  def save
    if id.present?
      update
    else
      create_record
    end
  end

  def destroy
    self.class.client.delete("#{self.class.collection_name}/#{id}")
  end

  def persisted?
    id.present?
  end

  private

  def create_record
    response = self.class.client.push(self.class.collection_name, attributes.except('id'))
    if response.success?
      self.id = response.body['name']
      true
    else
      puts "Firebase Error: #{response.body}"
      false
    end
  end

  def update
    self.class.client.update("#{self.class.collection_name}/#{id}", attributes.except('id'))
  end
end
