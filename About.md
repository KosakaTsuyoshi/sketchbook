# Introduction #

Sketchbookはインタラクティブデザイナーやアーティスト向けのヘルパーライブラリ集です。

AS3はアート作品等の小規模なプロジェクトには、記述が冗長すぎる傾向があります。

このライブラリは、onPressやonEnterFrame等のAS2ライクな簡易イベントハンドリングや、インタラクティブな作品を作るときの基本処理、機能をサポートするクラスを提供します。


# Sample Code #
例えばSpriteHelperクラスを使うことで、addEventListenerを用いることなくシンプルにマウスやエンターフレームのイベントをハンドリングできます。

```
var sprite:Sprite = new Sprite();
var helper = new SpriteHelper( sprite );  //Spriteの操作ヘルパー

helper.onEnterFrame = onEnterFrame
helper.onPress = onPress

function onPress():void
{
  trace("MouseClicked");
}

function onEnterFrame():void
{
  trace("enterFrame");
}
```


