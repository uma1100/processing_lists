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
		radius = 4.0;
		mass = 1.0;
		friction = 0.01;
		G = 1.0;
		// 位置、速度、加速度の初期化
		location = new PVector(0.0,0.0,0.0);
		velocity = new PVector(0.0,0.0,0.0);
		acceleration = new PVector(0.0,0.0,0.0);
		// 重力なし		
		gravity = new PVector(0.0,0.0,0.0);
		// 移動範囲の設定
		min = new PVector(0.0,0.0,0.0);
		max = new PVector(width,height,height/2);
	}
	// 運動方程式から位置を更新
	void update(){
		acceleration.add(gravity); //重力を加える
		velocity.add(acceleration); //加速度から速度を算出
		velocity.mult(1.0-friction); //摩擦力から速度の変化
		location.add(velocity); //位置の算出
		acceleration.set(0,0,0); //加速度を0ぬにリセット
	}
	void draw(){
		pushMatrix();
		translate(location.x, location.y, location.z);
		ellipse(0, 0, mass*radius*2, mass*radius*2);
		popMatrix();
	}
	// 力を加える
	void addForce(PVector force){
		force.div(mass); //力と質量から加速度を算出
		acceleration.add(force);
	}
	// 引力の計算
	void attract(PVector center,float _mass, float min, float max){
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
	void boundOffWalls(){
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
	void throughWalls(){
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
