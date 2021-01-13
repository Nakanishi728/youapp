<template>
  <v-row>
    <v-col
      cols="12"
      class="py-0"
    >
      <v-card-actions class="py-0">
        <v-spacer />
        <v-radio-group
          v-model="payment"
          row
        >
          <v-radio
            v-for="(pay, i) in payments"
            :key="`pay-${i}`"
            :label="(`menus.payments.${pay.label}`)"
            :value="pay.label"
            :color="pay.color"
          />
        </v-radio-group>
      </v-card-actions>
    </v-col>
    <v-col
      v-for="(plan, i) in plans"
      :key="`plan-${i}`"
      cols="12"
      :sm="12 / plans.length"
    >
      <v-card
        max-width="402"
        class="mx-auto"
      >
        <v-card-title
          :class="['white--text', plan.color]"
        >
          {{ plan.name }}
        </v-card-title>

        <v-card-title class="justify-center">
          {{ plan.exp }}
        </v-card-title>

        <v-divider />

        <v-card-title class="justify-center">
          メンバー
          {{ plan.member }}
        </v-card-title>

        <v-divider />

        <v-card-actions class="justify-center align-baseline">
          月
          <span class="px-2 display-1 font-weight-bold">
            {{ yen(plan.price[payment]) }}
          </span>
          円
        </v-card-actions>
        <v-card-actions class="justify-center align-baseline">
          年間 {{ yen(plan.price[payment] * 12) }} 円
        </v-card-actions>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
export default {
  data () {
    const payments = [
      { label: 'month', color: 'indigo' },
      { label: 'year', color: 'myblue' }
    ]
    return {
      payments,
      payment: payments[1].label,
      plans: [
        {
          name: 'オンリープラン',
          color: 'info',
          exp: '個人飲食店 向け',
          member: '1~3',
          price: {
            month: 0,
            year: 0
          }
        },
        {
          name: 'スモールプラン',
          color: 'primary',
          exp: '宅配 + 店舗販売 向け',
          member: '3~10',
          price: {
            month: 300,
            year: 200
          }
        },
        {
          name: 'ビジネスプラン',
          color: 'indigo',
          exp: '宅配専門店 向け',
          member: '10~30',
          price: {
            month: 600,
            year: 500
          }
        }
      ]
    }
  },
  computed: {
    yen () {
      return (val) => {
        return String(val).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,')
      }
    }
  }
}
</script>
