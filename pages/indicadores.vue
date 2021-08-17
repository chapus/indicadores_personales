<template>
  <v-card color="#FCFBF8">
    <v-container fluid>
      <v-row dense class="" justify="center">
        <v-col class="" cols="12">
          <v-card-text class="text-center">
            <h6 class="display-1 mb-1 grey--text">
              Coordinadora de comunicación
            </h6>

            <h4 class="display-2 font-weight-light mb-3 black--text">
              Jessica Mejía González
            </h4>
            <p class="font-weight-light grey--text mb-0">
              Seleccione el mes y año para mostrar los indicadores
            </p>
          </v-card-text>
        </v-col>
        <v-col class="" cols="12" sm="6">
          <v-select
            v-model="filtros.mes"
            :items="meses"
            filled
            label="Mes"
            @change="getIndicadores"
          ></v-select>
        </v-col>
        <v-col class="" cols="12" sm="6">
          <v-select
            v-model="filtros.anio"
            :items="anios"
            filled
            label="Año"
            @change="getIndicadores"
          ></v-select>
        </v-col>
      </v-row>
      <v-row dense>
        <v-col v-for="(indicador, idx) in indicadores" :key="`idc-${idx}`" class="text-center">
          <vue-ellipse-progress
            :progress="indicador.progress"
            line="butt"
            :color="emptyColor"
            :legend-value="indicador.obtenido"
            empty-color="#324c7e"
            :empty-color-fill="emptyColorFill"
            thickness="70"
            empty-thickness="20"
            :size="380"
            dash="strict 30 0.98"
            line-mode="in-over"
            animation="bounce 2000 100"
            :loading="loading"
            reverse
            font-size="2rem"
          >
            <span slot="legend-value">/{{ indicador.esperado }}</span>
            <p slot="legend-caption">
              <strong class="text-button font-weight-black">{{ indicador.indicador }}</strong> <br /> {{ indicador.progress }}%
            </p>
          </vue-ellipse-progress>
        </v-col>
      </v-row>
      <v-row>
        <v-col class="text-center" cols="12" sm="12">
          <v-btn depressed small color="secondary" to="/">Inicio </v-btn>
        </v-col>
      </v-row>
    </v-container>
  </v-card>
</template>

<script>
import randomNumberInRange from '@/utils/randomNumberInRange'
import Interval from '@/utils/interval'
import { jess } from '@/static/jessIndicadores'
export default {
  data: () => ({
    jess,
    indicadores: [],
    filtros: { mes: 'Enero', anio: 2021 },
    loading: true,
    progress: 88,
    emptyColor: {
      radial: true,
      colors: [
        {
          color: '#C08599',
          offset: '0',
          opacity: '0.1',
        },
        {
          color: '#C08599',
          offset: '100',
          opacity: 0.6,
        },
      ],
    },
    emptyColorFill: {
      radial: true,
      colors: [
        {
          color: '#99A8BB',
          offset: '0',
          opacity: 0,
        },
        {
          color: '#99A8BB',
          offset: '100',
          opacity: 0.15,
        },
      ],
    },
    meses: [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre',
    ],
    anios: [2021, 2022, 2023],
  }),
  computed: {
    component() {
      return this.test ? 'vue-ellipse-progress-test' : 'vue-ellipse-progress'
    },
    circles() {
      return this.circlesData
    },
  },
  mounted() {
    Interval.addTask(this.randomizeOptions)
    this.getIndicadores()
  },
  methods: {
    getIndicadores() {
      if (this.filtros.mes == null || this.filtros.anio == null) {
        this.indicadores = []
        return
      }
      console.log('jess', this.jess)
      if (this.jess[this.filtros.anio] == null) {
        this.indicadores = []
        return
      }
      if (this.jess[this.filtros.anio][this.filtros.mes] == null) {
        this.indicadores = []
        return
      }
      this.loading = true

      const data = this.jess[this.filtros.anio][this.filtros.mes]
      data.forEach((el, index, array) => {
        data[index].progress = Number(((el.obtenido * 100) / el.esperado).toFixed(2))
      })
      this.indicadores = data
      console.log('indicadores', this.indicadores)
      this.loading = false
    },
    randomizeOptions() {
      const gap = randomNumberInRange(2, 10)
      const thickness = randomNumberInRange(1, 3)
      const updatedData = []
      for (let n = 0; n < 6; n++) {
        updatedData.push({
          progress: randomNumberInRange(0, 100),
          angle: 20 * n, // randomNumberInRange(0, 100),
          color: this.colors[randomNumberInRange(0, 3)],
          gap,
          thickness,
        })
      }
      this.circlesData = updatedData
    },
  },
}
</script>
