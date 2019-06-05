class UserSerializer
    include FastJsonapi::ObjectSerializer
    set_type :user
    attributes :name, :email
end