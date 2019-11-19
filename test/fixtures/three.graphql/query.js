var query = `
## Renders a scene into a viewport with
## a PerspectiveCamera and a Scene containing
## a Mesh constructed with a BoxGeometry and
## a MeshBasicMaterial
query render($width: Float,
             $height: Float,
             #$rotateX: Float,
             #$rotateY: Float
             $tickr: Float) {
  ## Describes renderer
  WebGLRenderer {
    ## set viewport width/height based on context inputs
    setSize(width: $width, height: $height)

    ## Configures a PerspectiveCamera
    PerspectiveCamera(fov: 75, aspect: 1, near: 1, far: 10000) {
      setPosition(z: 500)
    }

    ## Describes a Scene
    Scene {

      ## Describes a named Mesh
      a: Mesh(name: "box-a") {
        setRotation(x: $tickr)
        setPosition(x: 200, y: 200)
        ...BoxWireframe
      }

      b: Mesh(name: "box-b") {
        setPosition(x: -200, y: -200)
        setRotation(y: $tickr)
        ...Box
      }

      c: Mesh(name: "box-c") {
        setRotation(z: $tickr)
        setPosition(x: 0)
        ...Box
      }
    }
  }
}

fragment BoxWireframe on Mesh {
  ## Contruct geometry and material for mesh
  BoxGeometry(width: 100, height: 100, depth: 100)
  MeshBasicMaterial(wireframe: true)
}

fragment Box on Mesh {
  BoxGeometry(width: 100, height: 100, depth: 100)
  MeshBasicMaterial(wireframe: false)
}
`;

var draw = {

    element : function() {

        var cm = document.getElementsByClassName('CodeMirror')[0];

        if (cm && cm.CodeMirror instanceof Object) {
 
            cm.CodeMirror.setValue(draw.encode(query));

        } else {

            window.requestAnimationFrame(draw.element);

        }

    },

    encode : function(val) {

        return val.replace(/^"(.*)"$/, "$1")
                  .replace(/\\n/g, "\n")
                  .replace(/&apos;/g, "'")
                  .replace(/&quot;/g, '"')
                  .replace(/&gt;/g, '>')
                  .replace(/&lt;/g, '<')
                  .replace(/&amp;/g, '&')
                  .replace(/<p>/g, '')
                  .replace(/<\/p>/g, '')
                  .replace(/‘/g, "'")
                  .replace(/’/g, "'")
        ;

    }

}
