import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class perlin_noise extends PApplet {



int NUM = 2000;
ParticleVec3[] particles = new ParticleVec3[NUM];
float noiseScale;
float noiseStrength;

public void setup() {
	
	frameRate(60);
	noiseScale = 0.01f;
	noiseStrength = 0.1f;
	// setup particles
	for (int i = 0; i < NUM; i++) {
		particles[i] = new ParticleVec3();
		particles[i].location.set(random(width),random(height),random(height/2));
		particles[i].min.set(0,0,0);
		particles[i].max.set(width,height,height/2);
		particles[i].gravity.set(0.0f,0.0f,0.0f);
		particles[i].friction = 0.1f;
		particles[i].radius = 1.0f;
	}
	background(255);
}

public void draw() {
	noStroke();
	fill(0,9);
	//rect(0, 0, width, height);
	for (int i = 0; i < NUM; i++) {
		PVector force = new PVector();
		force.x = cos(noise(
			particles[i].location.x * noiseScale, 
			particles[i].location.y * noiseScale,
			particles[i].location.z * noiseScale)* PI * 4.0f);
		force.y = sin(noise(
			particles[i].location.x * noiseScale, 
			particles[i].location.y * noiseScale,
			particles[i].location.z * noiseScale)* PI * 4.0f
		);
		force.mult(noiseStrength);
		particles[i].addForce(force);
		particles[i].update();
		particles[i].draw();
		particles[i].throughWalls();
	}
}

// マウスクリックで初期化
public void mousePressed() {
	noiseSeed(round(random(1000)));
	noiseScale = 0.01f;
	for (int i = 0; i < NUM; i++) {
		particles[i].location.set(random(width),random(height),random(height/2));
	}
	background(255);
}
class ParticleVec3 {
	PVector location; //位置
	PVector velocity; // 速度
	PVector acceleration; //加速度
	PVector gravity; //重力
	float mass; //質量
	float friction; //摩擦力
	PVector min; //移動範囲
	PVector max; //移動範囲
	float radius; //パーティクル半径
	float G; //重力定数

	//コンストラクタ
	ParticleVec3(){
		radius = 4.0f;
		mass = 1.0f;
		friction = 0.01f;
		G = 1.0f;
		// 位置、速度、加速度の初期化
		location = new PVector(0.0f,0.0f,0.0f);
		velocity = new PVector(0.0f,0.0f,0.0f);
		acceleration = new PVector(0.0f,0.0f,0.0f);
		// 重力なし		
		gravity = new PVector(0.0f,0.0f,0.0f);
		// 移動範囲の設定
		min = new PVector(0.0f,0.0f,0.0f);
		max = new PVector(width,height,height/2);
	}
	// 運動方程式から位置を更新
	public void update(){
		acceleration.add(gravity); //重力を加える
		velocity.add(acceleration); //加速度から速度を算出
		velocity.mult(1.0f-friction); //摩擦力から速度の変化
		location.add(velocity); //位置の算出
		acceleration.set(0,0,0); //加速度を0ぬにリセット
	}
	public void draw(){
		pushMatrix();
		translate(location.x, location.y, location.z);
		ellipse(0, 0, mass*radius*2, mass*radius*2);
		popMatrix();
	}
	// 力を加える
	public void addForce(PVector force){
		force.div(mass); //力と質量から加速度を算出
		acceleration.add(force);
	}
	// 引力の計算
	public void attract(PVector center,float _mass, float min, float max){
		float distance = PVector.dist(center,location);
		distance = constrain(distance, min, max);
		float strength = G * (mass * _mass) / (distance * distance);
		PVector force = PVector.sub(center, location);
		// ベクトルの正規化
		force.normalize();
		force.mult(strength);
		addForce(force);
  }
	// 壁でバウンド
	public void boundOffWalls(){
		if(location.x > max.x){
			location.x = max.x;
			velocity.x *= -1;
		}
		if(location.x < min.x){
			location.x = min.x;
			velocity.x *= -1;
		}
		if(location.y > max.y){
			location.y = max.y;
			velocity.y *= -1;
		}
		if(location.y < min.y){
			location.y = min.y;
			velocity.y *= -1;
		}
		if(location.z > max.z){
			location.z = max.z;
			velocity.z *= -1;
		}
		if(location.z < min.z){
			location.z = min.z;
			velocity.z *= -1;
		}
	}
	// 壁を突き抜けて反対側に出現
	public void throughWalls(){
		if(location.x > max.x){
			location.x = min.x;
		}
		if(location.x < min.x){
			location.x = max.x;
		}
		if(location.y > max.y){
			location.y = min.y;
		}
		if(location.y < min.y){
			location.y = max.y;
		}
		if(location.z > max.z){
			location.z = min.z;
		}
		if(location.z < min.z){
			location.z = max.z;
		}
	}
}
  public void settings() { 	size( 1920,1080,P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "perlin_noise" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
