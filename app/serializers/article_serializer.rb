class ArticleSerializer
    include FastJsonapi::ObjectSerializer
    set_type :article
    attributes :title, :description
end