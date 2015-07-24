# Introduction #

SpriteHelperはsketchbookの中核をなすクラスです。

このクラスはSprite,MovieClipの簡易イベントハンドリング、Graphics, Matrix, Transformクラス等へのショートカットなどを提供します。


# 使い方 #

```
var sp:Sprite = new Sprite();
var helper = new SpriteHelper(sp);
```

あるいはSpriteのサブクラスのコンストラクタ内で定義します。

この方法は外部のフレームワークや既に採用している、SpriteのサブクラスでSpriteHelperを使う場合に有効です。

```
public class SpriteExt extends Sprite{
  public var helper:SpriteHelper

  public function SpriteExt(){
    helper = new SpriteHelper(this)
  }
}
```


# イベントの登録 #

SpriteHelperの\*on + イベント名<**のプロパティに関数を割り当てることで、イベントをハンドリングすることができます。**

クロージャでハンドリングする例
```
helper.onMouseDown = function():void{
  trace("MousePressed");
}
```

あるいは既に存在する関数の参照を渡してやることもできます。
```
helper.onEnterFrame = onEnterFrame

function onEnterFrame():void{
  trace("onEnterFrame");
}
```

onKeyDownのような一部のイベントでは、イベントハンドラにkeyCode等の引数が渡されます。渡されるデータについてはリファレンスを参照してください。

```
helper.onKeyDown = onKeyDown

function onKeyDown( keyCode:Number ):void{
  trace("keycode: ",keyCode);
}
```


# 座標管理関数 #

SpriteHelperは、Spriteの座標をローカル、グローバル座標系に変換する関数を提供します。

  * **globalPoint** Spriteの座標をグローバル座標系で取得、設定します。
  * **globalX** SpriteのX座標をグローバル座標系で取得、設定します。
  * **globalY** SpriteのY座標をグローバル座標系で取得、設定します。

また、SpriteHelper.localToLocalという、あるローカル系座標を別のローカル系座標に変換する関数も存在します。


# プロパティへのショートカット #

SpriteHelperは関連づけられたSpriteのプロパティへのショートカットを持ちます。
頻繁に使用されるプロパティのほぼ全てには、SpriteHelperから直接アクセスすることができます。

  * x, y, width, height, alpha...等のSpriteの基本プロパティ
  * matrixおよび、translate, rotate等のtransform.matrix以下へのショートカット
  * graphicsおよび、beginFill等のSprite.graphics以下へのショートカット
  * colorTransformおよび、redOffset等のSprite.transform.colorTransform以下へのショートカット

```
var sp:Spriten = new Sprite();
var helper:SpriteHelper = new SpriteHelper(sp);

//プロパティショートカット
helper.x = 100;
helper.y = 100;

//描画ショートカット
helper.beginFill(0x000000,1);
helper.drawRect(0,0,100,100);
helper.endFill();

//Matrixショートカット
helper.translate(100,100);

//ColorTransformショートカット
helper.redOffset = 50;
helepr.blueMultiply = 1.5;
```