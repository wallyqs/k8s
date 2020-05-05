let NATS = https://wallyqs.github.io/nats.dhall/package.dhall

let cluster =
      NATS.Server.Cluster::{
      , name = "nats"
      , namespace = "default"
      , image = "nats:latest"
      , size = 3
      }

let natsk8s = NATS.K8S.toK8S cluster

in  NATS.K8S.toList natsk8s
