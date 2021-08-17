<template>
  <v-container fluid fill-height>
    <v-row justify="center" align="center">
      <v-col cols="12" md="6">
        <div class="text-center">
          <v-avatar size="200">
            <img
              src="https://avataaars.io/?avatarStyle=Circle&topType=LongHairStraight&accessoriesType=Blank&hairColor=BrownDark&facialHairType=Blank&clotheType=BlazerShirt&eyeType=Default&eyebrowType=Default&mouthType=Default&skinColor=Light"
              alt="Jessica"
            />
          </v-avatar>
        </div>
        <v-card-text class="text-center">
          <h6 class="display-1 mb-1 grey--text">
            Coordinadora de comunicación
          </h6>

          <h4 class="display-2 font-weight-light mb-3 black--text">
            Jessica Mejía González
          </h4>

          <p class="font-weight-light grey--text">
            No te preocupes por el fracaso; solo tienes que acertar una vez.
          </p>

          <v-btn color="success" rounded class="mr-0" to="/indicadores">
            Indicadores
          </v-btn>
        </v-card-text>
      </v-col>
    </v-row>
  </v-container>
</template>
